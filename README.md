# Openscad distrobox

Build openscad from source in a container via distrobox + podman/docker

Intended to allow iterative changes to openscad source code, for development inside a containerized environment, given the large set of dependencies/resource required to build openscad.

## Requires

* distrobox
* podman/docker

## Provides

* openscad-src: debian + openscad (OCI / podman / docker / distrobox) image.
* openscad-src-distrobox: above image as a distrobox container

## Usage

Build and enter openscad distrobox environment:

```
podman build -t openscad-src -f Containerfile .
distrobox create --name openscad-src-distrobox --image openscad-src
distrobox enter openscad-src-distrobox
```

Once inside the openscad-src-distrobox image, a development cycle could look like:

```
# go to source code location
cd /openscad

# EDIT src/core/...

# Rebuild changes and re-open openscad
cmake --build build && cmake --install build && openscad
```

## License

I am not a lawyer, this is not legal advice

* **ONLY** source code of this project, a containerfile script is covered by the ``LICENSE``, but **NOT** resulting container images you build, and *NOT* the openscad source code and it's dependencies.

**DO NOT** distribute container images you build with this project. Do not upload them to docker.io or similar services. To understand why, [read this report by the linux foundation](https://www.linuxfoundation.org/resources/publications/docker-containers-what-are-the-open-source-licensing-considerations).
