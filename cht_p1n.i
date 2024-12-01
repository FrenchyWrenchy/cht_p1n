[Mesh]
  [generated]
    type = GeneratedMeshGenerator
    dim = 3
    nx = 3
    ny = 3
    nz = 10
    xmax = 2
    ymax = 2
    zmax = 0.02
  []
[]

[Variables]
  [T]
  []
[]

[Kernels]
  [heat_conduction]
    type = HeatConduction
    variable = T
  []
[]

[Materials]
  [thermal]
    type = HeatConductionMaterial
    thermal_conductivity = 13.4
  []
[]

[BCs]
  [t_left]
    type = DirichletBC
    variable = T
    value = 473.15
    boundary = 'front'
  []
  [t_right]
    type = DirichletBC
    variable = T
    value = 773.15
    boundary = 'back'
  []
[]

[VectorPostprocessors]
  [./point_sample]
    type = PointValueSampler
    variable = 'T'
    points = '1 1 0.0  1 1 0.001  1 1 0.003  1 1 0.005  1 1 0.007  1 1 0.009  1 1 0.011  1 1 0.013  1 1 0.015  1 1 0.017  1 1 0.019  1 1 0.02'
    sort_by = id
  [../]
[]

[Executioner]
  type = Steady
[]


[Outputs]
  execute_on = TIMESTEP_END
  csv = true
  exodus = true
[]


