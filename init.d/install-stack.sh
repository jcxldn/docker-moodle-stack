set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purposes

# Load libraries with logging functions
if [[ -f /opt/bitnami/base/functions ]]; then
    . /opt/bitnami/base/functions
else
    . /opt/bitnami/scripts/liblog.sh
fi

repos=(
    "maths/moodle-qbehaviour_dfexplicitvaildate question/behaviour/dfexplicitvaildate"
    "maths/moodle-qbehaviour_dfcbmexplicitvaildate question/behaviour/dfcbmexplicitvaildate"
    "maths/moodle-qbehaviour_adaptivemultipart question/behaviour/adaptivemultipart"
    "maths/moodle-qtype_stack question/type/stack"
)

failure=0

for r in "${repos[@]}"
do
    set -- $r
    info "Cloning repository '$1' (to '$2')"
    git clone -q https://github.com/$1.git /bitnami/moodle/$2 || failure=1
    [[ "$failure" -ne 0 ]] && error "Failed to execute clone repository '$1'"
done

exit "$failure"