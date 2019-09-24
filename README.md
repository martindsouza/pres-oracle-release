

# Oracle DB Release Process

Live Slides: [bit.ly/oow19-release](http://bit.ly/oow19-release)


## Gitpitch (for Martin)

[Docs](https://gitpitch.com/docs/)

http://localhost:9090/gitpitch/desktop/manager

http://localhost:9090/gitpitch/desktop

https://gitpitch.com/martindsouza/pres-oracle-release/master

```bash

docker pull gitpitch/desktop:pro

docker run -it \
	-v ~/Documents/GitHub/martindsouza/pres-oracle-release:/repo \
  -e PORT=9090 \
	-e SWEEP=false \
	-p 9090:9090 \
	gitpitch/desktop:pro


docker run -it -d \
  --name=gitpitch \
	-v ~/Documents/GitHub/martindsouza/pres-oracle-release:/repo \
  -e PORT=9090 \
	-p 9090:9090 \
	gitpitch/desktop:pro


```