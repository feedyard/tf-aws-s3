# tf-aws-state-bucket testing fixture

Initially, the testing fixtures were part of a kitchen-terraform develoment pattern. With the introduction of aws-sdk 3  
the dependency conflicts with kitchen-terraform and awspec make this unworkable. The fixtures will remain pending a  
potential resolution with the tools. Meanwhile, use of the module requires greater integration testing than would  
otherwise be required.

## requirements

1. aws credentials with permissions
1. bucket to receive log files