# Jetbrains IDE's for KASM Workspaces

### Docker images built for [KASM Workspaces](https://www.kasmweb.com/) for each of the Jetbrains IDEs.

## General
All images are built on a kiosk version of Ubuntu Focal LTS (20.04.06), and contain the following tools:
* Curl
* Git
* Nano
* Wget
* Google Chrome
* Mozilla Firefox

## Images
The following IDE's have images, with the listed tools

* [CLion](https://www.jetbrains.com/clion) - A cross-platform IDE for C and C++
	* [PlatformIO](https://platformio.org/)

* [DataGrip](https://www.jetbrains.com/datagrip/) - Many databases, one tool

* [GoLand](https://www.jetbrains.com/goland/) - A Go IDE with extended support for JavaScript, TypeScript, and databases

* [IntelliJ IDEA](https://www.jetbrains.com/idea/) - The Leading Java and Kotlin IDE
	* Zip / UnZip
	* OpenJDK
	* [Kotlin](https://kotlinlang.org/)

* [WebStorm](https://www.jetbrains.com/webstorm/) - The smartest JavaScript IDE
	* UnZip
	* [NodeJS 18 LTS](https://nodejs.org/)
	* [Node Package Manager](https://www.npmjs.com/)
	* [Deno](https://deno.com)

## How to use

* This script will build the required images to your local docker image repository. You should run it on your KASM host to make the images available to KASM.

* Git and Docker should be preinstalled (both a prerequisit of KASM).

1. Clone the repo
`git clone git@github.com:mp-strachan/kasm-jetbrains.git`

2. Open repo
`cd kasm-jetbrains`

3. Run the build script and follow the prompts to build your selected images
`./build.sh`

4. From KASM Workspaces admin, add your container images. The image name will be the IDE name, tagged with the version
`intellij:2023.1.2`

5. It is recommended to enable persistant profiles, so your users will have access to their plug-ins, settings, etc, between sessions, and to retain license activation.
