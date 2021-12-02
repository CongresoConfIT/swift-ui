//
//  Post.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 2/12/21.
//

import Foundation

struct Post: Decodable {
    let id: Int
    let date: Date
    let title: String
    let content: String
    let featuredMedia: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case title
        case content
        case featuredMedia
    }
    
    enum TitleCodingKeys: String, CodingKey {
        case rendered
    }
    
    enum ContentCodingKeys: String, CodingKey {
        case rendered
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        date = try values.decode(Date.self, forKey: .date)
        featuredMedia = try values.decode(Int?.self, forKey: .featuredMedia)

        let titleValues = try values.nestedContainer(keyedBy: TitleCodingKeys.self, forKey: .title)
        title = try titleValues.decode(String.self, forKey: .rendered)
        
        let contentValues = try values.nestedContainer(keyedBy: ContentCodingKeys.self, forKey: .content)
        content = try contentValues.decode(String.self, forKey: .rendered)
    }

}

extension Post {
    static var debug: Post! {
        let jsonData = """
                      {
                         "id":1650,
                         "date":"2021-11-14T20:22:47",
                         "date_gmt":"2021-11-14T19:22:47",
                         "guid":{
                            "rendered":"https://confit.es/?p=1650"
                         },
                         "modified":"2021-11-14T21:21:39",
                         "modified_gmt":"2021-11-14T20:21:39",
                         "slug":"concurso-conf-it-talks",
                         "status":"publish",
                         "type":"post",
                         "link":"https://confit.es/novedades/concurso-conf-it-talks/",
                         "title":{
                            "rendered":"Concurso Conf.IT Talks"
                         },
                         "content":{
                            "rendered":"
                      <p>Como habéis podido ir viendo por nuestras redes sociales, cada ponencia de las <a href="https://confit.es/talks">Conf.IT Talks</a> irá acompañada de un concurso a través de Twitter. Si queréis participar, tenéis que <strong>seguir a la cuenta del congreso en Twitter (<a rel="noreferrer noopener" href="https://twitter.com/CongresoConfIT" target="_blank">@CongresoConfIT</a>) y subir una foto asistiendo a la ponencia, mencionándonos&nbsp; y usando los hashtags</strong> #ConfITalks y el correspondiente al concurso de esa semana, que se anunciará la semana previa a la conferencia por nuestras redes sociales.</p>



                      <p>La publicación que tenga mas retweets al final de la semana será elegida ganadora. La anunciaremos en la siguiente ponencia, por lo que <strong>¡no os olvidéis de asistir!</strong></p>



                      <p>Los premios variarán cada semana, y serán artículos como:<br>&#8211; Auriculares inalámbricos.<br>&#8211; Libro &#8220;Python Playground: Geeky Projects for the Curious Programmer&#8221;.<br>&#8211; Raspberry Pi Zero.<br><strong>¡Y muchos más!</strong></p>



                      <p>Para más información, consulta <a href="https://confit.es/wp-content/uploads/2021/11/Bases-concurso-Conf.IT-Talks.pdf" target="_blank" rel="noreferrer noopener">nuestras bases</a>.</p>



                      <p>En caso de tener cualquier duda, podéis contactarnos por redes sociales (@CongresoConfIT en <a href="https://twitter.com/CongresoConfIT" target="_blank" rel="noreferrer noopener">Twitter</a> y en <a href="https://www.instagram.com/congresoconfit/" target="_blank" rel="noreferrer noopener">Instagram</a>) o escríbenos a <a href="mailto:info@confit.es" target="_blank" rel="noreferrer noopener">info@confit.es</a>.</p>



                      <h4 class="has-text-align-center"><meta charset="utf-8"><strong><a href="https://confit.es/talks">¡No olvides apuntarte a las Conf.IT Talks!</a></strong></h4>
                      ",
                            "protected":false
                         },
                         "excerpt":{
                            "rendered":"<p>Como habéis podido ir viendo por nuestras redes sociales, cada ponencia de las Conf.IT Talks irá acompañada de un concurso a través de Twitter. Si queréis participar, tenéis que seguir a la cuenta del congreso en Twitter (@CongresoConfIT) y subir una foto asistiendo a la ponencia, mencionándonos&nbsp; y usando los hashtags #ConfITalks y el correspondiente &hellip;</p>
                      <p class="read-more"> <a class="" href="https://confit.es/novedades/concurso-conf-it-talks/"> <span class="screen-reader-text">Concurso Conf.IT Talks</span> Leer más &raquo;</a></p>
                      ",
                            "protected":false
                         },
                         "author":4,
                         "featured_media":1666,
                         "comment_status":"closed",
                         "ping_status":"open",
                         "sticky":false,
                         "template":"",
                         "format":"standard",
                         "meta":{
                            "site-sidebar-layout":"",
                            "site-content-layout":"",
                            "ast-main-header-display":"",
                            "ast-hfb-above-header-display":"",
                            "ast-hfb-below-header-display":"",
                            "ast-hfb-mobile-header-display":"",
                            "site-post-title":"",
                            "ast-breadcrumbs-content":"",
                            "ast-featured-img":"",
                            "footer-sml-layout":"",
                            "theme-transparent-header-meta":"",
                            "adv-header-id-meta":"",
                            "stick-header-meta":"",
                            "header-above-stick-meta":"",
                            "header-main-stick-meta":"",
                            "header-below-stick-meta":""
                         },
                         "categories":[
                            32
                         ],
                         "tags":[
                            
                         ],
                         "acf":[
                            
                         ],
                         "_links":{
                            "self":[
                               {
                                  "href":"https://confit.es/wp-json/wp/v2/posts/1650"
                               }
                            ],
                            "collection":[
                               {
                                  "href":"https://confit.es/wp-json/wp/v2/posts"
                               }
                            ],
                            "about":[
                               {
                                  "href":"https://confit.es/wp-json/wp/v2/types/post"
                               }
                            ],
                            "author":[
                               {
                                  "embeddable":true,
                                  "href":"https://confit.es/wp-json/wp/v2/users/4"
                               }
                            ],
                            "replies":[
                               {
                                  "embeddable":true,
                                  "href":"https://confit.es/wp-json/wp/v2/comments?post=1650"
                               }
                            ],
                            "version-history":[
                               {
                                  "count":17,
                                  "href":"https://confit.es/wp-json/wp/v2/posts/1650/revisions"
                               }
                            ],
                            "predecessor-version":[
                               {
                                  "id":1675,
                                  "href":"https://confit.es/wp-json/wp/v2/posts/1650/revisions/1675"
                               }
                            ],
                            "wp:featuredmedia":[
                               {
                                  "embeddable":true,
                                  "href":"https://confit.es/wp-json/wp/v2/media/1666"
                               }
                            ],
                            "wp:attachment":[
                               {
                                  "href":"https://confit.es/wp-json/wp/v2/media?parent=1650"
                               }
                            ],
                            "wp:term":[
                               {
                                  "taxonomy":"category",
                                  "embeddable":true,
                                  "href":"https://confit.es/wp-json/wp/v2/categories?post=1650"
                               },
                               {
                                  "taxonomy":"post_tag",
                                  "embeddable":true,
                                  "href":"https://confit.es/wp-json/wp/v2/tags?post=1650"
                               }
                            ],
                            "curies":[
                               {
                                  "name":"wp",
                                  "href":"https://api.w.org/{rel}",
                                  "templated":true
                               }
                            ]
                         }
                      }
                    """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        return try! decoder.decode(Post.self, from: jsonData)
    }
}
