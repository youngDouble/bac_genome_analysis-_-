#����Anaconda3 ��װ�ļ�
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.3.0-Linux-x86_64.sh
#��װ Anaconda3
bash Miniconda3-py38_4.8.2-Linux-x86_64.sh
#������ʾ��Ϣ�����س���ENTER��������

#conda���ù��ھ���
source ~/miniconda3/bin/activate
#source ~/anaconda3/bin/activate
conda config --add channels http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
conda config --add channels http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
conda config --add channels http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda
conda config --add channels http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes

# ����һ��С������Ϊ bioinfo
conda create -n bioinfo

#�����½����Ļ��� bioinfo  ����װ prokka ���
conda activate bioinfo
conda install  -y prokka

#���԰�װ���
#prokka -h
#���ְ�����Ϣ��װ�ɹ�

#��װϸ��������������������ʿؼ���װ���
conda install  -y  fastp spades

## ע�� Escherichia coli  ��׼�� K-12
# �������� "\" ��һ�е�ĩβ��ʾ������û����� �س�������һ�м����������������� ����һ�����������ʾ
prokka --outdir K-12 --prefix K-12 --locustag K_12 \
--addgenes --addmrna --compliant --centre CDC \
--genus Escherichia --species "Escherichia coli" --strain K-12 \
--kingdom Bacteria --usegenus --cpus 4 --rfam --rnammer --force ./fasta_example_genomic.fna



#��������װ eggnogmapper -c ָ�� ����ͨ��
conda create -y -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/  \
-n eggnogmapper eggnog-mapper

# cd �����ݿ�Ŀ¼
cd path/to/emapper_databse
# --data_dir ����ָ�����ش洢��λ�ã� $PWD ��ʾ��ǰĿ¼��·�� �൱������� path/to/emapper_databse
download_eggnog_data.py  -y --data_dir $PWD

#ʹ��emapperע�͵�������
emapper.py --data_dir /pub/biodatabase/eggnog_5.0/database/  --database bact -m diamond  --cpu 20 \
--output_dir eggnog_out  --output eggnog_result -i test.faa