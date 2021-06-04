FROM openjdk:17-alpine

LABEL maintainer <opsxcq@strm.sh>

RUN apk add --no-cache libgomp gcompat libstdc++

RUN wget https://www.languagetool.org/download/LanguageTool-5.3.zip && \
    unzip *.zip && \
    rm *.zip

EXPOSE 9422

WORKDIR /LanguageTool-5.3

CMD ["java","-cp","languagetool-server.jar","org.languagetool.server.HTTPServer","--port","9422","--public","--allow-origin","'*'"]
