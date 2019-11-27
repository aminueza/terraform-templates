<!-- PROJECT LOGO -->
<p align="center">
  <a href="https://github.com/aminueza/minio-api">
    <img src="https://logodix.com/logo/1686050.png" alt="minio-api" width="200">
  </a>

  <h3 align="center" style="font-weight: bold">TERRAFORM TEMPLATES</h3>

  <p align="center">
    A set of useful terraform templates to manage AWS resources
    <br />
    <a href="https://www.terraform.io/docs/providers/aws/index.html"><strong>Explore terraform docs »</strong></a>
    <br />
    <br />
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#cknowledgements)

<!-- ABOUT THE PROJECT -->
## About The Project

Terraform templates provide a set of HCL templates to manage AWS resources using `IAC` concepts (Infraestructure As A Code). 

<!-- TECHNOLOGIES -->
### Built With

Terraform templates was made <span style="color: #e25555;">&#9829;</span> based on:
* [Terraform](https://www.terraform.io)

<!-- GETTING STARTED -->
## Getting Started

To apply terraform templates, `Terraform` must first be installed on your machine. Terraform is distributed as a binary package for all supported platforms and architectures.

### Prerequisites

Before running terraform templates, download [terraform client](https://www.terraform.io/downloads.html) and [install](https://learn.hashicorp.com/terraform/getting-started/install.html) acconding to your `OS`.

### Installation

1. Clone the repo:
```sh
git clone https://github.com/aminueza/terraform-templates.git
```
2. Access the desired terraform template and fill out all [variables](iam_roles/variables.tf):
```sh
cd terraform-templates/iam_roles
```
3. Init terraform provider:
```sh
terraform init
```
4. Verify all changes to be applied:
```sh
terraform plan
```
4. Check all changes and apply the template:
```sh
terraform apply
```
<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/aminueza/terraform-templates/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated** <span style="color: #e25555;">&#9829;</span>.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/TerraformFeature`)
3. Commit your Changes (`git commit -m 'Add some TerraformFeature'`)
4. Push to the Branch (`git push origin feature/TerraformFeature`)
5. Open a [Pull Request](https://github.com/aminueza/terraform-templates/pulls)

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->
## Contact

**Amanda Souza** ([amandasouza.app](https://amandasouza.app))

**Email:** [amanda@amandasouza.app](amanda@amandasouza.app)

**Project Link:** [https://github.com/aminueza/terraform-templates](https://github.com/aminueza/terraform-templates)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Hashicorp](https://www.hashicorp.com)
* [Best Readme](https://github.com/othneildrew/Best-README-Template)
* [AWS](http://aws.amazon.com)