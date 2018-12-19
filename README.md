# Yet Another Static Site Generator

## Installation & Usage

To build the environment image:
```
docker build -f Dockerfile -t yassg .
```
As long as dependencies are not changed, there is no need to rebuild the image.

Once the image is built, the container help can be displayed with:
```
docker run -ti --mount src=$(pwd),dst=/tmp/builder/,type=bind --rm --name yassg yassg
```

# Contributors

- Alexandre Quemy <alexandre.quemy@gmail.com>


