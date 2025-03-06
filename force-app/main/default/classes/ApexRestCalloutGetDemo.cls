public class ApexRestCalloutGetDemo {
    public static void ApexRestCalloutGetDemo() {

        Http httpObj = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://reqres.in/api/users/2');
        req.setMethod('GET');

        HttpResponse res = httpObj.send(req);
        System.debug('Status Code = '+res.getStatusCode());
        System.debug('Response - '+res.getBody());
    }
}