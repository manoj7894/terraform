# How to create Dockerfile
# Use an official Nginx image as the base image
FROM nginx:latest

# Expose the HTTP port (default is 80)
EXPOSE 80

# Define the command to start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
