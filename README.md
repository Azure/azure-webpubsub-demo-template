# Template Repository for Developing Trackable Live Demo for Web PubSub Service

In short, to create a live demo to Azure Web PubSub service:

1. Develop your live demo using template of [demo-template](./demo-template/), for more requirements, see [this section](#coding).
2. Deploy your live demo based on [setup-resource-group.sh](./deploy/common/setup-resource-group.sh), for more details, see [this section](#how-to-deploy-on-azure).
3. Create a pull request by copying `demo-template` to [samples](https://github.com/Azure/azure-webpubsub/tree/main/samples/javascript) which follow the [Requirements](#requirements).

## Requirements

### Coding

- [ ] Use `sample_` as hub name prefix
- [ ] [Integrate Google Analytics](docs/how-to-integrate-google-analytics.md) in live demo
- [ ] Google Analytics: [Reuse event](docs/how-to-integrate-google-analytics.md#custom-methods)
- [ ] Google Analytics: Only send actions triggered by visitors, or errors. `NO` customer content involves
- [ ] Remove Google Analytics in `main` branch
- [ ] Add Google Analytics in `live-demo` branch

### Deployment

- [ ] Deploy to your live demo subscription
- [ ] Resource group should be named start with `awps-live-demo-`

### Pull Request

- [ ] Your sample should contain [README](./demo-template/README.md)
- [ ] Your sample should contain [deploy.py](./demo-template/deploy/deploy.sh)

## How to Integrate Google Analytics in Demo

[doc](docs/how-to-integrate-google-analytics.md)

## How to Deploy on Azure

1. Use [script](./deploy/common/setup-resource-group.sh) to create a locked resource group with a web pubsub service.
2. deploy other services in this group.

## How to Create Pull Request to Azure/azure-webpubsub Repository

1. Rename `demo-template` to a good name.
2. Create a pull request to `live-demo` branch **with** Google Analytics
3. Create a pull request to `main` **without** Google Analytics

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
