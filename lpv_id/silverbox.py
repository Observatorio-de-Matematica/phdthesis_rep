import deepSI
from matplotlib import pyplot as plt
from scipy.io import loadmat
full = deepSI.datasets.Silverbox(split_data=False)
test = full.sdl[1][100:40575]
train, val = deepSI.datasets.Silverbox()
from encoder_LPV_models import LPV_multi_encoder, LPV_single_encoder

def write_to_file(name, logY, varname):
    with open(name, "w+") as f:
        f.write(varname + " = [" + str(logY[0]) + ",\n")
        for i in range(1, logY.size - 1):
            f.write(str(logY[i]) + ",\n")
        f.write(str(logY[logY.size - 1]) + "];\n")

sys = LPV_single_encoder(nx=2, Np=1, na=10, nb=10, feedthrough=True, \
            include_u_in_p=True, f_net_kwargs=dict(F=10), \
            e_net_kwargs=dict(n_nodes_per_layer = 64, n_hidden_layers = 1), \
            p_net_kwargs=dict(n_nodes_per_layer = 64, n_hidden_layers = 1))
sys.init_model(sys_data=train)
#sys.fit(train, train[-30000:], epochs = 500, \
#   loss_kwargs=dict(nf=50, loss_nf_cutoff=0.5))
sys.unique_code = "F6FZSA"
sys.checkpoint_load_system("_best", "results")

print("LPV single encoder, nx=2, Np=1, na=nb=10")
res = sys.apply_experiment(test)
print("Test RMS: " + str(res.RMS(test) * 1000) + " mV")
res2 = sys.apply_experiment(val)
print("Val RMS: " + str(res2.RMS(val) * 1000) + " mV")
indx = 32000
res3 = sys.apply_experiment(test[:indx])
print("Test RMS: " + str(res3.RMS(test[:indx]) * 1000) + " mV")

write_to_file("silverbox_nx2_np1_test.m",         res.y,  "hy_test")
write_to_file("silverbox_nx2_np1_val.m",          res2.y, "hy_val")
write_to_file("silverbox_nx2_np1_test_real.m",    test.y, "y_test")
write_to_file("silverbox_nx2_np1_val_real.m",     val.y,  "y_val")

sys = LPV_single_encoder(nx=4, Np=3, na=10, nb=10, feedthrough=True,
            include_u_in_p=True, f_net_kwargs=dict(F=10), \
            e_net_kwargs=dict(n_nodes_per_layer = 64, n_hidden_layers = 1), \
            p_net_kwargs=dict(n_nodes_per_layer = 64, n_hidden_layers = 1))
sys.init_model(sys_data=train)
#sys.fit(train, train[-30000:], epochs = 500, \
#   loss_kwargs=dict(nf=50, loss_nf_cutoff=0.5))
sys.unique_code = "0016JQ"
sys.checkpoint_load_system("_best", "results")

print("LPV single encoder, nx=4, Np=3, na=nb=10")
res = sys.apply_experiment(test)
print("Test RMS: " + str(res.RMS(test) * 1000) + " mV")
res2 = sys.apply_experiment(val)
print("Val RMS: " + str(res2.RMS(val) * 1000) + " mV")
indx = 32000
res3 = sys.apply_experiment(test[:indx])
print("Test RMS: " + str(res3.RMS(test[:indx]) * 1000) + " mV")

write_to_file("silverbox_nx4_np3_test.m",         res.y,  "hy_test")
write_to_file("silverbox_nx4_np3_val.m",          res2.y, "hy_val")
write_to_file("silverbox_nx4_np3_test_real.m",    test.y, "y_test")
write_to_file("silverbox_nx4_np3_val_real.m",     val.y,  "y_val")

sys = LPV_multi_encoder(nx=4, Np=3, na=10, nb=10, feedthrough=True, \
            include_u_in_p=True, f_net_kwargs=dict(F=10), \
            e_net_kwargs=dict(n_nodes_per_layer = 64, n_hidden_layers = 1), \
            p_net_kwargs=dict(n_nodes_per_layer = 64, n_hidden_layers = 1))
sys.init_model(sys_data=train)
#sys.fit(train, train[-30000:], epochs = 500, \
#   loss_kwargs=dict(nf=50, loss_nf_cutoff=0.5))
sys.unique_code = "t7tuZQ"
sys.checkpoint_load_system("_best", "results")

print("LPV multi encoder, nx=4, Np=3, na=nb=10")
res = sys.apply_experiment(test)
print("Test RMS: " + str(res.RMS(test) * 1000) + " mV")
res2 = sys.apply_experiment(val)
print("Val RMS: " + str(res2.RMS(val) * 1000) + " mV")
indx = 32000
res3 = sys.apply_experiment(test[:indx])
print("Test RMS: " + str(res3.RMS(test[:indx]) * 1000) + " mV")

write_to_file("multi_silverbox_nx4_np3_test.m",         res.y,  "hy_test")
write_to_file("multi_silverbox_nx4_np3_val.m",          res2.y, "hy_val")
write_to_file("multi_silverbox_nx4_np3_test_real.m",    test.y, "y_test")
write_to_file("multi_silverbox_nx4_np3_val_real.m",     val.y,  "y_val")
