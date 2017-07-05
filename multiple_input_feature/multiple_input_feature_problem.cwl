cwlVersion: v1.0
class: Workflow

requirements:
  - class: MultipleInputFeatureRequirement


inputs: 
  string: string


outputs: 
  out_file: 
    type: File
    outputSource: concat_files/out_file


steps:
  
  generate_first_file:
    run:
      class: CommandLineTool
      baseCommand: ["echo"]
      inputs: 
        string: 
          type: string
          inputBinding:
            position: 1
      outputs: 
        out_file: stdout
    in: 
      string: string
    out: [out_file]

  generate_second_file:
    run:
      class: CommandLineTool
      baseCommand: ["echo"]
      inputs: 
        string: 
          type: string
          inputBinding:
            position: 1
      outputs: 
        out_file: stdout
    in: 
      string: string
    out: [out_file]

  concat_files:
    run:
      class: CommandLineTool
      baseCommand: ["cat"]
      inputs:
        files:
          type: File[]?
          inputBinding:
            position: 1
      outputs: 
        out_file: stdout
      stdout: "output.txt"
    in: 
      files:
        - generate_first_file/out_file
        - generate_second_file/out_file
    out: [out_file]

