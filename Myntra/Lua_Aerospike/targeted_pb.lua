-- Generated by protobuf; do not edit
local module = {}
local protobuf = require 'protobuf'

module.TARGETEDCARDINFO = protobuf.Descriptor()
module.TARGETEDCARDINFO_STYLE_IDS_FIELD = protobuf.FieldDescriptor()
module.TARGETEDCARDINFO_CHILDREN_FIELD = protobuf.FieldDescriptor()
module.TARGETEDCARDINFO_END_TIME_FIELD = protobuf.FieldDescriptor()
module.TARGETEDCARDINFO_OBJECT_DATA_FIELD = protobuf.FieldDescriptor()
module.TARGETEDCARDINFO_MODIFIED_AT_FIELD = protobuf.FieldDescriptor()

module.TARGETEDCARDINFO_STYLE_IDS_FIELD.name = 'style_ids'
module.TARGETEDCARDINFO_STYLE_IDS_FIELD.full_name = '.com.myntra.ingestion.TargetedCardInfo.style_ids'
module.TARGETEDCARDINFO_STYLE_IDS_FIELD.number = 1
module.TARGETEDCARDINFO_STYLE_IDS_FIELD.index = 0
module.TARGETEDCARDINFO_STYLE_IDS_FIELD.label = 3
module.TARGETEDCARDINFO_STYLE_IDS_FIELD.has_default_value = false
module.TARGETEDCARDINFO_STYLE_IDS_FIELD.default_value = {}
module.TARGETEDCARDINFO_STYLE_IDS_FIELD.type = 5
module.TARGETEDCARDINFO_STYLE_IDS_FIELD.cpp_type = 1

module.TARGETEDCARDINFO_CHILDREN_FIELD.name = 'children'
module.TARGETEDCARDINFO_CHILDREN_FIELD.full_name = '.com.myntra.ingestion.TargetedCardInfo.children'
module.TARGETEDCARDINFO_CHILDREN_FIELD.number = 2
module.TARGETEDCARDINFO_CHILDREN_FIELD.index = 1
module.TARGETEDCARDINFO_CHILDREN_FIELD.label = 3
module.TARGETEDCARDINFO_CHILDREN_FIELD.has_default_value = false
module.TARGETEDCARDINFO_CHILDREN_FIELD.default_value = {}
module.TARGETEDCARDINFO_CHILDREN_FIELD.type = 9
module.TARGETEDCARDINFO_CHILDREN_FIELD.cpp_type = 9

module.TARGETEDCARDINFO_END_TIME_FIELD.name = 'end_time'
module.TARGETEDCARDINFO_END_TIME_FIELD.full_name = '.com.myntra.ingestion.TargetedCardInfo.end_time'
module.TARGETEDCARDINFO_END_TIME_FIELD.number = 3
module.TARGETEDCARDINFO_END_TIME_FIELD.index = 2
module.TARGETEDCARDINFO_END_TIME_FIELD.label = 2
module.TARGETEDCARDINFO_END_TIME_FIELD.has_default_value = false
module.TARGETEDCARDINFO_END_TIME_FIELD.default_value = 0
module.TARGETEDCARDINFO_END_TIME_FIELD.type = 3
module.TARGETEDCARDINFO_END_TIME_FIELD.cpp_type = 2

module.TARGETEDCARDINFO_OBJECT_DATA_FIELD.name = 'object_data'
module.TARGETEDCARDINFO_OBJECT_DATA_FIELD.full_name = '.com.myntra.ingestion.TargetedCardInfo.object_data'
module.TARGETEDCARDINFO_OBJECT_DATA_FIELD.number = 4
module.TARGETEDCARDINFO_OBJECT_DATA_FIELD.index = 3
module.TARGETEDCARDINFO_OBJECT_DATA_FIELD.label = 2
module.TARGETEDCARDINFO_OBJECT_DATA_FIELD.has_default_value = false
module.TARGETEDCARDINFO_OBJECT_DATA_FIELD.default_value = ''
module.TARGETEDCARDINFO_OBJECT_DATA_FIELD.type = 9
module.TARGETEDCARDINFO_OBJECT_DATA_FIELD.cpp_type = 9

module.TARGETEDCARDINFO_MODIFIED_AT_FIELD.name = 'modified_at'
module.TARGETEDCARDINFO_MODIFIED_AT_FIELD.full_name = '.com.myntra.ingestion.TargetedCardInfo.modified_at'
module.TARGETEDCARDINFO_MODIFIED_AT_FIELD.number = 5
module.TARGETEDCARDINFO_MODIFIED_AT_FIELD.index = 4
module.TARGETEDCARDINFO_MODIFIED_AT_FIELD.label = 2
module.TARGETEDCARDINFO_MODIFIED_AT_FIELD.has_default_value = false
module.TARGETEDCARDINFO_MODIFIED_AT_FIELD.default_value = 0
module.TARGETEDCARDINFO_MODIFIED_AT_FIELD.type = 3
module.TARGETEDCARDINFO_MODIFIED_AT_FIELD.cpp_type = 2

module.TARGETEDCARDINFO.name = 'TargetedCardInfo'
module.TARGETEDCARDINFO.full_name = '.com.myntra.ingestion.TargetedCardInfo'
module.TARGETEDCARDINFO.nested_types = {}
module.TARGETEDCARDINFO.enum_types = {}
module.TARGETEDCARDINFO.fields = {module.TARGETEDCARDINFO_STYLE_IDS_FIELD, module.TARGETEDCARDINFO_CHILDREN_FIELD, module.TARGETEDCARDINFO_END_TIME_FIELD, module.TARGETEDCARDINFO_OBJECT_DATA_FIELD, module.TARGETEDCARDINFO_MODIFIED_AT_FIELD}
module.TARGETEDCARDINFO.is_extendable = false
module.TARGETEDCARDINFO.extensions = {}

module.TargetedCardInfo = protobuf.Message(module.TARGETEDCARDINFO)


module.MESSAGE_TYPES = {'TargetedCardInfo'}
module.ENUM_TYPES = {}

return module
