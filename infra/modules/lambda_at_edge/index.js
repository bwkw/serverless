exports.handler = (event, context, callback) => {
    const request = event.Records[0].cf.request;
    const headers = request.headers;
    
    // Set new HTTP header with key 'header-name' and value 'header-value'
    headers['header-name'] = [{key: 'header-name', value: 'header-value'}];
    
    // Return control to CloudFront with the modified request
    callback(null, request);
};
