// This file is an example. Please rename it to .directus-sync.config.untracked.js and complete empty variable
// The renamed version should not be track on git because it contains secrets.

module.export = {
    // Login of the admin account. 
    // This should be the same as DIRECTUS_ADMIN_EMAIL and DIRECTUS_ADMIN_PASSWORD parameters of .env file.
    directusEmail: 'directus.earthling695@slmail.me', // ignored if directusToken is provided
    directusPassword: 'my-directus-password', // ignored if directusToken is provided
  
};
