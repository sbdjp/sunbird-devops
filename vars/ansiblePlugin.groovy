// common plugin to general ansible tasks
def call(Map pipelineParams) {

    node(pipelineParams.agent){
        // cloning public sunbird-devops and private repo
        stage('checkout private repo') {
            if (params.private_repo_branch != "")
                values.put('privateBranch', params.private_repo_branch)
            else
                values.put('privateBranch', params.private_repo_branch)
            dir('sunbird-devops-private'){
            git branch: pipelineParams.privateBranch, url: pipelineParams.scmUrl, credentialsId: private_repo_credentials
            }
        }

        stage('ansible') {
            println pipelineParams
//            sh """
//            ansible-playbook -i $WORKSPACE/sunbird-devops-private/ansible/inventories/$pipelineParams.env \
//            $WORKSPACE/ansible/$pipelineParams.ansiblePlaybook $pipelineParams.ansibleExtraArgs
//            """
        }
    }
}
