FROM directus/directus:11.1.2
#FROM directus-fork:latest

# Don't really sure about what this is about 
# but it came for directus docs (https://docs.directus.io/extensions/installing-extensions.html#installing-via-the-npm-registry)
USER root
RUN corepack enable


# Change user to install extension and init the database
USER node

# Install extensions to directus
#WORKDIR /directus # Seems to not be util
# RUN pnpm install directus-extension-api-docs
# RUN pnpm install directus-extension-sync@^3.0.0


# Install dependencies for init script
WORKDIR /database-init
RUN npm install typescript
RUN npm install -save-dev @types/node
RUN npm install @directus/sdk
RUN npm install directus-sync@^3.0.0




# Return to directus dir to allow automatic launch of directus
WORKDIR /directus
# ! Nothing should be write after this