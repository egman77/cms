#FROM microsoft/aspnet:4.7 是windows 2016内核,不能跑在window2019/10下 
FROM microsoft/aspnet

RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*

WORKDIR /inetpub/wwwroot

COPY Dockerfile.ps1 .

RUN powershell -executionpolicy bypass .\Dockerfile.ps1

COPY build/ .
