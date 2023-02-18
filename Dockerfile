FROM alpine
RUN apk add --no-cache curl tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
RUN echo "*/1 * * * * /usr/bin/curl 'http://10.2.131.242/api/portal/v1/login' \
        -H 'Accept: application/json, text/javascript, */*; q=0.01' \
        -H 'Accept-Language: zh-CN,zh;q=0.9' \
        -H 'Connection: keep-alive' \
        -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
        -H 'Origin: http://10.2.131.242' \
        -H 'Referer: http://10.2.131.242/portal/index.html' \
        -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36' \
        -H 'X-Requested-With: XMLHttpRequest' \
        --data-raw '{\"domain\":\"cmcc\",\"username\":\"user\",\"password\":\"pwd\"}' \
        --compressed --insecure" >> /etc/crontabs/root
ENV TZ=Asia/Shanghai
COPY start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]
