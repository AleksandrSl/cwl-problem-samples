# Multiple input feature problem

## Runner version

*cwltool version: 1.0.20170704143016*

## Normal behaviour

When workflow step has requiered array of smth as input all works perfect both in case when step input are gathered from workflow input and from other steps' output
See files multiple_input_feature_simple.cwl and multiple_input_feature.cwl, respectively.

## Potential error

When workflow step has optional array of smth as input there are problems in both cases.
See files multiple_input_feature_simple_problem.cwl and multiple_input_feature_problem.cwl, respectively.

Stacktrace:
```
Tool definition failed validation:
multiple_step_input_problem.cwl:33:11: Source 'out_file' of type "File" is incompatible
multiple_step_input_problem.cwl:63:7:   with sink 'files' of type ["null", {"type": "array", "items": "File"}]
multiple_step_input_problem.cwl:63:7:   sink has linkMerge method merge_nested
multiple_step_input_problem.cwl:48:11: Source 'out_file' of type "File" is incompatible
multiple_step_input_problem.cwl:63:7:   with sink 'files' of type ["null", {"type": "array", "items": "File"}]
multiple_step_input_problem.cwl:63:7:   sink has linkMerge method merge_nested
```
