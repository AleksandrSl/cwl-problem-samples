cwlVersion: v1.0
class: Workflow

requirements:
  - class: MultipleInputFeatureRequirement


inputs: 
  file_1: File
  file_2: File


outputs: 
  out_file: 
    type: File
    outputSource: concat_files/out_file


steps:

  concat_files:
    run:
      class: CommandLineTool
      baseCommand: ["cat"]
      inputs:
        files:
          type: File[]
          inputBinding:
            position: 1
      outputs: 
        out_file: stdout
      stdout: "output.txt"
    in: 
      files:
        - file_1
        - file_2
    out: [out_file]
