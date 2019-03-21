public class PostToChatterContact {
    public static void postChatterContact(List<Contact> newContacts){
        system.debug('postChatterContact is starting'); 
        for(contact c : newContacts){
            if(c.email == null){
                system.debug('Contact with Last Name:' + c.LastName + 'did not have an email specified');
            }else {
                ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(Network.getNetworkId(), c.Id, ConnectApi.FeedElementType.FeedItem, 'Email this person!');
            }
        }
              
        system.debug('postChatterContact is ending');   
    }
}