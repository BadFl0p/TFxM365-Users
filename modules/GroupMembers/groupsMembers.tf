data "azuread_group" "groups" {
  for_each = toset(var.groups)
  display_name = each.value
}

resource "azuread_group_member" "group_members" {
  for_each = toset(var.groups)

  group_object_id = data.azuread_group.groups[each.value].object_id
  member_object_id = var.user
}