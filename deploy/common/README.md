# Best Practice of Deploying Live Demo to Azure

Use this [setup-resource-group.sh](./setup-resource-group.sh) to set up a resource group with a `CanNotDelete` and a Web PubSub instance. e.g.

```bash
./setup-resource-group.sh -d demoname -u 1 -l eastus -s 0000
```

To configure event handler, refer to [Event handler in Azure Web PubSub service](https://docs.microsoft.com/azure/azure-web-pubsub/howto-develop-eventhandler).
