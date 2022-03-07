% Copyright (C) 2022 University of Michigan
%
% Contact: Eliana Crawford <crawforde@kenyon.edu>, Brian Arbic <arbic@umich.edu>
%
% This source is subject to the license found in the file 'LICENSE'
% which must be be distributed together with this source. All other
% rights reserved.

import NetCDFFile;
import ParameterPresets;
import PlotTools;
import Simulation;
close all;
clearvars;
PlotTools.set_global_defaults();

presets = ParameterPresets.by_name('A');

% MAKE COLORBAR IN ITS OWN FIGURE
fig = PlotTools.create_default_figure('A Values - Colorbar', [100 600 600 800]);
PlotTools.create_standalone_colorbar(presets.CRange, presets.CTicks);
PlotTools.save_image(fig, '/global_a/global_a_colorbar');

simulations = Simulation.list_all();
for plot_index = 1:1:length(simulations)
  sim = simulations(plot_index);
  fig = PlotTools.create_default_figure(['Global A Values - simulation #' sim.Number]);
  file = NetCDFFile.read_parameter_file(sim, presets);
  PlotTools.plot_parameter(presets, file);
  PlotTools.save_image(fig, ['/global_a/global_a_' sim.Number]);
end