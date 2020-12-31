---
Title: ECHR Open Data - Build and Deployment Process for an open source data project
Date: 2020-12-31 20:40
Category: Engineering
Tags: Engineering
Lang: en
---

[TOC]

!!! example "About this entry"
	![](https://echr-opendata.eu/assets/images/logo.png) This entry is part of a serie on the engineering part behind the **[European Court of Human Rights Open Project (ECHR-OD)](http://echr-opendata.eu/)**.


# Introduction

The **[European Court of Human Rights Open Project (ECHR-OD)](http://echr-opendata.eu/)** aims at providing data about the European Court of Human Rights. To reach this objective, the project follows few standards to ensure the highest possible data quality. In particular, 

1. no data is manipulated by hand,
2. the whole creation process is available and open-source such that the consummable data can be recreated from scratch,
3. each generated piece of data must be versionned and intermediate file must be publicly available.

==This is particularily important because on top of the usual pitfals common to all open-source projects, data projects can also suffer from poor data quality. The large amount of data makes it barely impossible to check for every chunk of data, and a lot of malformed data might go undiscovered, even with proper QA tests.==

In this article, I present the general **DevOps strategy** adopted for the ECHR-OD project. Bare in mind that this project is managed only by myself and on my free time, and with very limited resources. Therefore, many aspects presented here are engineered taking into account these constraints. In other words, many parts would not scale for first class industrial projects.

Following the above-mentioned principles, we defined the following constraints on the release process:

1. The build and deployment must happen **automatically** on a regular basis,
2. The build and deployment must be **fully automated**,
3. The only point of failure must be connectivity or hardware (i.e. not the code, QA must be enforced properly, which is outside the scope of this entry),
4. A build failure should not be released but also not impact future build attempt nor production.


# High Level Picture

The projects is composed of two main components:

- The **[process](https://github.com/echr-od/ECHR-OD_process)** of collecting and processing the data from scratch,
- The **[explorer](https://github.com/echr-od/ECHR-OD_explorer)**, a web component that serves three purposes: 
	1. the **main frontend** for the project, including downloading the latest data, 
	2. the **API** to programmatically retrieve the data, 
	3. the **explorer** itself to visualize and explore the data.

Both have a separated git repository on [GitHub](https://github.com). Both components are containerized for scalability, convenience and reproducibility.

The container *process* generates a build `build_name` in a folder `build`. This folder is mounted into the container `explorer` which loads the latest build at startup.


!!! note ""
	The whole **build and deployment strategy** relies on three elements:

	1. **GitHub Workflows**, that is our starting point for automations and most QA related tasks,
	2. **ECHR-OD Workflows**, designed similarily to GitHub's one, that enable modular build for tight resources,
	3. A **Runner**, which in this case is a small dedicated server with only 2Gb RAM, and serves both to host the explorer but also to build the data.   
	The explorer component runs behind a NGINX reverse-proxy.


The release (build and deployment) process is is illustrated by the following sequence diagram:

<center>
[![](https://mermaid.ink/img/eyJjb2RlIjoic2VxdWVuY2VEaWFncmFtXG4gICAgR2l0SHViLT4-K0dpdEh1YjogV29ya2Zsb3cgTW9udGhseSBSZWxlYXNlXG4gICAgR2l0SHViLS0-PlByb2Nlc3M6IFRyaWdnZXIgV29ya2Zsb3cgXCJEYXRhYmFzZVwiXG4gICAgcmVjdCByZ2IoNjYsIDEyOCwgMTkyLCAwLjIpXG4gICAgUHJvY2Vzcy0tPj5FeHBsb3JlcjogQ2FsbCAvYXBpL2J1aWxkL3VwZGF0ZVxuICAgIEV4cGxvcmVyLT4-K0V4cGxvcmVyOiBSZXN0YXJ0IERvY2tlclxuICAgIGVuZCAgICAgICAgIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoic2VxdWVuY2VEaWFncmFtXG4gICAgR2l0SHViLT4-K0dpdEh1YjogV29ya2Zsb3cgTW9udGhseSBSZWxlYXNlXG4gICAgR2l0SHViLS0-PlByb2Nlc3M6IFRyaWdnZXIgV29ya2Zsb3cgXCJEYXRhYmFzZVwiXG4gICAgcmVjdCByZ2IoNjYsIDEyOCwgMTkyLCAwLjIpXG4gICAgUHJvY2Vzcy0tPj5FeHBsb3JlcjogQ2FsbCAvYXBpL2J1aWxkL3VwZGF0ZVxuICAgIEV4cGxvcmVyLT4-K0V4cGxvcmVyOiBSZXN0YXJ0IERvY2tlclxuICAgIGVuZCAgICAgICAgIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)
</center>

The **three steps** can be described as follows:

1. Every month, the **[Cyclic Database Release](https://github.com/echr-od/ECHR-OD_process/actions?query=workflow%3A%22Cyclic+Database+Release%22)** workflow is automatically triggered by GitHub.
	 - Build the image with the latest source
	 - Trigger test and coverage
	 - Build a small database with only 100 documents
	 - Push the image to [docker.io](https://hub.docker.com/repository/docker/aquemy1/echr_build/)
	 - Trigger ECHR-OD Workflow **"Deploy"**
2. The ECHR-OD Workflow **"Database"** is then started
3. The endpoint `/api/build/update` of the explorer API is called which trigger the update and the container reboot


!!! danger "Limited resources"
    Because the server we use had only 2Gb RAM, it is impossible to regenerate the NLP models, including entity extraction, Bag-of-Words and associated models. For this reason, the monthly release includes only the database creation. The NLP models are regenerated once in a while manually. 

    You can support this project through my GitHub sponsor page. A larger sponsor value would eneable me to pay for a server capable of regenerating the language models on a regular basis.

    <center>
    <iframe src="https://github.com/sponsors/aquemy/card" title="Sponsor aquemy" height="225" width="600" style="border: 0;"></iframe>
    </center>


# Deployment and Update

## Deploy Workflow
 
The **workflow "Deploy"** consists of a single action that does the following:

1. Open a SSH connection to a given server,
2. Clone a repository in a given location if it does not exist,
3. Checkout the new code from `origin`,
4. Create a `tmux` session and attach,
5. Trigger the workflow specified in the parameters of the Deploy workflow, including the final endpoint call specified (in our case `/api/v1/build/update`),
6. Detach the process

==The source code for the action "Deploy" can be found [here](https://github.com/echr-od/ECHR-OD_process/blob/develop/echr/steps/deploy.py).==


!!! danger "GitHub Action usage limits"
	At this stage, the GitHub Workflow "Cyclic Database Release" will finish. This means that there is *no way* for GitHub to alert us if a build fails. The reason the process is detached is because each job is limited to 6h, and 72h for a workflow, which is not enough for our purposes. However, if a build fails, we are still informed by the badge produced thanks to the API described thereafter. On top of that, a failing build does not impact production as it will not be deployed, thus an acceptable unconvenience at our level.


## Build History, Build API and Build upgrade

For the explorer container to know that there is a new build, we introduced the build history and build info. Whenever a build is finished, a short summary is appended to the build `build/.build_history` and a descriptive file `build_info.yml` is added to `build/<build_name>`. 

!!! note "Current and Latest build"
	**Latest build** refers to the latest attempt performed buy the workflow. **Current build** refers to the build currently served by the explorer (i.e. in production).


The explorer provides a simple API, mostly for internal usage, to manage build status:


- **Latest build status for badge** `/api/v1/build/status`:  
`{"schemaVersion":1,"label":"Database Update","message":"2020/12/19 23:04:48","color":"green"}`  
![](https://camo.githubusercontent.com/fff13eaf507f8d59dd228a6f06a85ad381576b638518e117ca25267944e0cf15/68747470733a2f2f696d672e736869656c64732e696f2f656e64706f696e743f75726c3d6874747073253341253246253246656368722d6f70656e646174612e657525324661706925324676312532466275696c64253246737461747573)

- **Current build status** `/api/v1/build/current`:  
`{"build_time":"2020/12/19 23:04:48"}`

- **Check if a new build is available** `/api/v1/build/new_build_available`:  
```[false,null]```
or ```[true,<build_name>]```

and the most important:

- **Update the current build** `/api/v1/build/update`:
	1. Check if there is no running build and if a new build is available
	2. Create a backup for the current build in case it needs to be rolled back
	3. Copy and replace the current build by the new build
	4. Restart the `explorer` container

The last operation is slightly technical, because we need to restart the container from the container.
But ultimately, the container is restarted and the new SQLite database is loaded such that the explorer can serve the updated data.

# Conclusion

As we have seen, the main challenges faced by ECHR-OD are the **lack of resources** and the **time constraint** on GitHub Workflows. Initially, GitHub Workflows are made for pure software DevOps, and therefore, a time limit of 72h might be reasonable. However, for data science projects with a need to (pre)process large amount of data on a regular basis, this limit is easy to reach. We get around this limit by using our own server and a flexible and modular workflow system, inspired by GitHub and that we will describe in another entry.

Another engineering challenge was the properly **synchronized the process container with the explorer container** such that the explorer container is aware of the existence a new build and can restart itself.

Finally, we ensure that the production data is not disturbed by a **failing build**, which should happen only in case of problem with the runner (most likely connectivity or hardware issue).
