ansible-playbook 8.MPITests.yml --inventory $(echo node{1..4}.pbs.toy|tr " " ,) --connection podman

#echo /usr/lib64/mpich/bin/mpirun -ppn 2 -env HYDRA_TOPO_DEBUG=1 hostname | qsub -l nodes=4 -j oe -N mpich
#echo /usr/lib64/mvapich2/bin/mpirun -ppn 2 hostname | qsub -l nodes=4 -j oe -N mvapich2
#echo '/usr/lib64/openmpi/bin/mpirun -hostfile $PBS_NODEFILE -x FI_PROVIDER=^psm3 -map-by ppr:2:node -oversubscribe hostname' | qsub -l nodes=4 -j oe -N openmpi

#echo /usr/lib64/mpich/bin/mpirun -ppn 2 -env HYDRA_TOPO_DEBUG=1 /usr/lib64/mpich/bin/mpitests-osu_allreduce | qsub -l nodes=4 -j oe -N mpich
#echo /usr/lib64/mvapich2/bin/mpirun -ppn 2 -env LD_LIBRARY_PATH /usr/lib64/mvapich2/lib /usr/lib64/mvapich2/bin/mpitests-osu_allreduce | qsub -l nodes=4 -j oe -N mvapich2
#echo '/usr/lib64/openmpi/bin/mpirun -hostfile $PBS_NODEFILE -x FI_PROVIDER=^psm3 -map-by ppr:2:node -oversubscribe -report-bindings /usr/lib64/openmpi/bin/mpitests-osu_allreduce' | qsub -l nodes=4 -j oe -N openmpi

