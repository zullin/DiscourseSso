FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY src/DiscourseSso/*.csproj ./src/DiscourseSso/
RUN dotnet restore

# copy everything else and build app
COPY src/DiscourseSso/. ./src/DiscourseSso/
WORKDIR /app/src/DiscourseSso
RUN dotnet publish -c Release -o out


FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/src/DiscourseSso/out ./
ENTRYPOINT ["dotnet", "DiscourseSso.dll"]