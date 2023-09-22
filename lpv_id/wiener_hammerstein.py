import deepSI
from matplotlib import pyplot as plt
train, test = deepSI.datasets.WienerHammerBenchMark(split_data=True)
from encoder_LPV_models import LPV_multi_encoder, LPV_single_encoder

sys = LPV_single_encoder(nx=6, Np=3, na=20, nb=20, feedthrough=True, \
            include_u_in_p=True, f_net_kwargs=dict(F=10), \
            e_net_kwargs=dict(n_nodes_per_layer = 64, n_hidden_layers = 1), \
            p_net_kwargs=dict(n_nodes_per_layer = 64, n_hidden_layers = 1))
sys.init_model(sys_data=train, optimizer_kwargs=dict(lr = 1e-03))
#sys.fit(train, train[-30000:], epochs = 10000,
#   loss_kwargs=dict(nf=80, loss_nf_cutoff=2))
sys = deepSI.load_system('results/wh_nx6_np3_na20_nb20')

res = sys.apply_experiment(test)
print("Test RMS: " + str(res.RMS(test) * 1000) + " mV")
print("Test NRMS: " + str(res.NRMS(test) * 100) + "%")
print("Test BFR: " + str((res.BFR(test))) + "%")

name1 = "wh_out.m"
name2 = "wh_real_out.m"

logY = res.y
logYR = test.y
with open(name1, "w+") as f:
    f.write("y = [" + str(logY[0]) + ",\n")
    for i in range(1, logY.size - 1):
        f.write(str(logY[i]) + ",\n")
    f.write(str(logY[logY.size - 1]) + "];\n")

with open(name2, "w+") as f:
    f.write("yr = [" + str(logYR[0]) + ",\n")
    for i in range(1, logY.size - 1):
        f.write(str(logYR[i]) + "\n")
    f.write(str(logYR[logY.size - 1]) + "];\n")

sys = LPV_multi_encoder(nx=6, Np=3, na=20, nb=20, feedthrough=True, \
        include_u_in_p=True, f_net_kwargs=dict(F=10), \
        e_net_kwargs=dict(n_nodes_per_layer = 64, n_hidden_layers = 1), \
        p_net_kwargs=dict(n_nodes_per_layer = 64, n_hidden_layers = 1))
sys.init_model(sys_data=train, optimizer_kwargs=dict(lr = 1e-03))
#sys.fit(train, train[-30000:], epochs = 10000, \
#   loss_kwargs=dict(nf=80, loss_nf_cutoff=2))
sys.unique_code = "VtASXA"
sys.checkpoint_load_system("_best", "results")
res = sys.apply_experiment(test)
print("Test RMS: " + str(res.RMS(test) * 1000) + " mV")
print("Test NRMS: " + str(res.NRMS(test) * 100) + "%")
print("Test BFR: " + str((res.BFR(test))) + "%")

name1 = "results/wh_out.m"
name2 = "results/wh_real_out.m"

logY = res.y
logYR = test.y
with open(name1, "w+") as f:
    f.write("y = [" + str(logY[0]) + ",\n")
    for i in range(1, logY.size - 1):
        f.write(str(logY[i]) + ",\n")
    f.write(str(logY[logY.size - 1]) + "];\n")

with open(name2, "w+") as f:
    f.write("yr = [" + str(logYR[0]) + ",\n")
    for i in range(1, logY.size - 1):
        f.write(str(logYR[i]) + "\n")
    f.write(str(logYR[logY.size - 1]) + "];\n")
