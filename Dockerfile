############################################################ 
# Dockerfile to build Alpine image 
# Based on Alpine:3.5
############################################################

FROM alpine:3.5
MAINTAINER XinYe <nunchuk@live.com>

ENV TIMEZONE=Asia/Shanghai

# Add AliCloud repository
# > If you are using Aliyun ECS, the package mirror server can be replaced by 
# > 'mirrors.cloud.aliyuncs.com', via Aliyun private network.
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories

# Set timezone
RUN apk --update add --no-cache tzdata && \
	cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
	echo ${TIMEZONE} > /etc/timezone

# Clean up
RUN apk del tzdata && \
	rm -rf /var/cache/apk/*