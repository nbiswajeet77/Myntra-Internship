# import traceback
# import urllib
# from adsrank.context import app
# from adsrank.service import personalizer
# from adsrank.cache import ad_vector_cache, ad_metadata_cache
# import time
# from adsrank.util.header import get_value_from_context_header
# from adsrank.util.user_vector import deserialize_user_vector
# from adsrank.util.helper import split_to_map
def score_ads(request,context):
    store_id = '2297'
    if context.invocation_metadata()[0].key == 'x-mynt-ctx':
        mynt_ctx = context.invocation_metadata()[0].value
        #store_id = get_value_from_context_header(mynt_ctx, 'storeid')

    user_details = request.user_details
    device_state = None
    # if not request.device_state.connection_type and not request.device_state.carrier and not request.device_state.model and not request.device_state.latitude and not request.device_state.longitude:
    #     device_state = request.device_state
    #     try:
    #         if device_state is not None:
    #             device_state = urlib.parse.unquote_plus(device_state)
    #     except:
    #         app.logger.error("Error parsing device_state " + device_state + "\n" + traceback.format_exc())

    city = request.city
    state = request.state
    result = adscorer(request,store_id,user_details,device_state,city,state)
    return result

def adscorer(request,store_id,user_details,device_state,city,state):
    result = {}
    status = {}
    try:
        user_vector = None
        if user_details.vector:
            user_vector_b64encoded = user_details.vector
            # if user_vector_b64encoded:
            #     user_vector = deserialize_user_vector(user_vector_b64encoded)
        ab_test_variants = {"default_abtest":"default_variant"}
        if request.user_details.ab_test_variants != {}:
            ab_test_variants = request.user_details.ab_test_variants
        version = 1.0
        if user_details.version != 0.0:
            version = user_details.version
        is_logged_in = user_details.is_logged_in
        object_ids = request.object_ids
        banners = []
        for object_id in object_ids:
            banner = {}
            banner["objectId"] = object_id
            # ad_vector_data = ad_vector_cache[store_id].retrieve_from_cache(banner["objectId"])
            # ad_meta_data = ad_metadata_cache[store_id].retrieve_from_cache(banner["objectId"])
            # banner["vector"] = ad_vector_data["vector"]
            # banner["version"] = ad_vector_data["version"]
            # banner["startTime"] = ad_meta_data.get("startTime",int(time.time() * 1000))
            # banner["metrics"] = ad_meta_data["metrics"]
            # banner["ctr"] = ad_meta_data.get("ctr",1.0)
            banners.append(banner)
        scores = []
        latitude = 0.0
        longitude = 0.0
        carrier = ''
        connection_type = ''
        model = ''
        # if device_state.connection_type:
        #     connection_type = device_state.connection_type
        # if device_state.carrier:
        #     carrier = device_state.carrier
        # if device_state.model:
        #     model = device_state.model
        # if device_state.latitude != 0.0:
        #     latitude = device_state.latitude
        # if device_state.longitude != 0.0:
        #     longitude = device_state.longitude
        # if len(banners) > 0:
        #     scores = personalizer.score_banners_uv(banners, user_vector, ab_test_variants, is_logged_in, store_id, version, connection_type, carrier, model, latitude, longitude, city ,state)
        status['message'] = 'Ads are scored successfully'
        # status['statusType'] = 'SUCCESS'
        # status['totalCount'] = len(scores)
        scores_with_object_ids = []
        # for i in range(len(banners)):
        #     print(request.device_state == NULL)
            #scores_with_object_ids.append({'object_id':banners[i]['objectId'],'score':scores[i]})
        result['total_count'] = len(scores)
        result['status'] = status
        result['ad_scores'] = scores_with_object_ids
        return result
    except:
        userId = ''
        if user_details.user_id:
            user_id = user_details.user_id
        status['message'] = 'Error while scoring the ads '
        #status['statusType'] = 'FAILURE'
        #status['totalCount'] = 0
        result['status'] = status
        result['ad_scores'] = []
        return result
