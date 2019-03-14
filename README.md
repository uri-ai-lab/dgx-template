# NVidia DGX Quick Start Guide
This template is intended to help first time users of the AI Lab DGX server.

## Step 1: Log in to the educational cluster
Verify that you can log in to the educational cluster using the user name and
password you received. The clusters are available via SSH. If you are
travelling, you might need to use a VPN connection.

The recommended Windows client is Putty. From a Mac, you can use ssh from the
Terminal application (found under /Applications/Utilities). Linux users can run
ssh from any terminal or console.

To access the Educational cluster, use:

```
ssh -l username seawulf.uri.edu
```

The first time you log in you will be asked to reset your password. After you reset your password, you may be required to log in again.

## Step 2: Run example code
When using the DGX server it is required that you submit your code to a container environment through a scheduler. The container system we use is [Singularity](https://www.sylabs.io/guides/3.0/user-guide/) and the scheduler is [Slurm](https://slurm.schedmd.com/). This repo contains a shell script called ```example.slurm``` which you can use to submit a job to slurm. Note that shell script references a default singularity container, ```tensorflow-gpu-py3-plus.simg```. This container provides a Linux environment, with Python 3 and commonly used GPU libraries. If you find that your code has dependencies that are not included in this container, let us know and we can help you build one that works.  

You can test your environment by cloning this Github repo into your seawulf workspace:

```
git clone https://github.com/uri-ai-lab/dgx-template.git
cd dgx-template
sbatch --time=1:00:00 example.slurm ./scripts/helloworld.py
```
After you run the sbatch command, you should see a message telling you that your batch job was submitted and giving you the job id. When your code has finished running, a slurm output file will appear in your working directory with the name ```slurm-nnnnn.out``` where ```nnnnn``` is the job id. The output file will contain messages and the output of any print statements. If your code doesn't generate an output file right away you can check the slurm queue by using the command ```squeue``` to the position of your job.

## Step 3: Run your own code
For convenience, you may want to write code on your own system and copy it to seawulf. I recommend using a version control system like git and GitHub to do this, but if your unfamiliar with this approach, you can use a command line tool like scp or a gui tool like WinSCP, Filezilla, Cyberduck, etc. to copy your files. If you are comfortable using emacs or vi you can, of course, directly edit your code on seawulf.  

Once you have written your code and copied it to seawulf, you can run it with the same ```sbatch``` command used in the example above. For that to work, you'll need to run ```sbatch``` in the same directory as ```example.slurm``` (or whatever you rename it) and provide a correct path to your code. So, for example, if you've copied both ```example.slurm``` and a script called ```mycode.py``` to a subdirectory of your home directory called ```myproject``` you would run it as follows:

```
cd ~/myproject
sbatch --time=1:00:00 example.slurm mycode.py
```

## Getting help
Don't hesitate to contact me by [email](hdekker@uri.edu) if you need help. 

