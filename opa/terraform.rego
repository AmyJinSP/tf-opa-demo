package terraform.analysis

import input as tfplan

resource_types = {"aws_subnet", "aws_vpc"}


default authz = false
authz {
    not touches_subnet
}

touches_subnet {
    all := resources["aws_subnet"]
    count(all) > 0

}

# list of all resources of a given type
resources[resource_type] = all {
    some resource_type
    resource_types[resource_type]
    all := [name |
        name:= tfplan.resource_changes[_]
        name.type == resource_type
    ]
}


