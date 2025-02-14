FROM linuxserver/nextcloud:30.0.6


LABEL author="storezhang<华寅>" \
    email="storezhang@gmail.com" \
    qq="160290688" \
    wechat="storezhang" \
    description="基于LinuxServer/Nextcloud的Nextcloud镜像，主要用于Nextcloud基于Docker的自动更新（基于天朝操蛋的网络环境，基于Docker中央仓库无法实现自动更新）"


COPY docker /


RUN set -ex \
    \
    \
    \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk --no-cache add jq \
    && chmod +x /custom-services.d/* \
    \
    \
    \
    # 清理临时文件
    && rm -rf /var/cache/apk/*


# 用户信息
ENV NEXTCLOUD_USERNAME ""
ENV NEXTCLOUD_PASSWORD ""

# 检查信息
ENV CHECK_ONLYOFFICE true

# 任务信息
ENV TASK_UPGRADE true
