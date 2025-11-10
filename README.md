# FibScale

A [Fibonacci number](https://en.wikipedia.org/wiki/Fibonacci_number) calculator
designed to demonstrate horizontal
[scaling](https://en.wikipedia.org/wiki/Scalability) with [load
balancing](<https://en.wikipedia.org/wiki/Load_balancing_(computing)>).

[![build](https://github.com/ArchiDep/fibscale/actions/workflows/build.yml/badge.svg)](https://github.com/ArchiDep/fibscale/actions/workflows/build.yml)
[![publish](https://github.com/ArchiDep/fibscale/actions/workflows/publish.yml/badge.svg)](https://github.com/ArchiDep/fibscale/actions/workflows/publish.yml)
[![license](https://img.shields.io/github/license/ArchiDep/fibscale)](https://opensource.org/licenses/MIT)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Requirements](#requirements)
- [Setup](#setup)
- [Run the application](#run-the-application)
- [Configuration](#configuration)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Requirements

- [Ruby](https://www.ruby-lang.org) 3.x

## Setup

```bash
# Clone the repository
git clone https://github.com/AlphaHydrae/fibscale.git

# Install dependencies
cd fibscale
bundle install
```

## Run the application

Execute the following command in the application's directory:

```bash
bundle exec ruby fibscale.rb
```

## Configuration

The FibScale application can take one optional integer argument:

```bash
bundle exec ruby fibscale.rb 3
```

This integer is a worker number and will change the color of the navbar (cycling
through a list of seven pre-configured colors). This makes it easy to identify
multiple deployed instances.

Further configuration is possible through environment variables:

| Environment variable     | Default value | Description                                                                     |
| :----------------------- | :------------ | :------------------------------------------------------------------------------ |
| `FIBSCALE_HOST`          | `0.0.0.0`     | IP address to listen on (or `0.0.0.0` for any address).                         |
| `FIBSCALE_PORT`          | `3000`        | The port the application will listen on.                                        |
| `FIBSCALE_DELAY`         | `0`           | An optional artificial delay in seconds before returning each result.           |
| `FIBSCALE_MAX`           | `10000`       | The maximum Fibonacci number that can be computed.                              |
| `FIBSCALE_RECURSIVE_MAX` | `40`          | The maximum Fibonacci number that can be computed with the recursive algorithm. |
