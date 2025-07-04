PORTNAME=	libapreq2
PORTVERSION=	2.17
CATEGORIES=	www perl5 devel
MASTER_SITES=	APACHE_HTTPD/libapreq
DISTFILE=	libapreq2-${PORTVERSION}
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl binding for the Generic Apache2 Request Library
WWW=		https://metacpan.org/dist/libapreq2

LICENSE=	Apache-2.0

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-apache2-apxs=${APXS} \
		--with-expat=${LOCALBASE} \
		--enable-perl-glue --with-perl=${PERL}
USES=		apache cpe libtool perl5
CPE_VENDOR=	apache
USE_PERL5=	run
USE_LDCONFIG=	yes

BUILD_DEPENDS=	libapreq2>0:www/libapreq2 \
		${APACHE_PKGNAMEPREFIX}mod_perl2>=0:www/mod_perl2 \
		p5-ExtUtils-XSBuilder>=0:devel/p5-ExtUtils-XSBuilder \
		p5-Parse-RecDescent>=0:devel/p5-Parse-RecDescent

RUN_DEPENDS=	libapreq2>0:www/libapreq2 \
		${APACHE_PKGNAMEPREFIX}mod_perl2>=0:www/mod_perl2 \
		p5-Parse-RecDescent>=0:devel/p5-Parse-RecDescent

post-patch:
	@${REINPLACE_CMD} -i '' -e "s!%%APACHEINCLUDEDIR%%!${APACHEINCLUDEDIR}!" \
		${WRKSRC}/glue/perl/Makefile.PL
post-install:
	# remove all the non-perl stuff
	${RM} ${PREFIX}/bin/apreq2-config
	${RM} -r ${PREFIX}/include/apreq2
	${RM} ${PREFIX}/${APACHEINCLUDEDIR}/apreq2/apreq_module_apache2.h
	${RM} ${PREFIX}/lib/libapreq2*
	${RM} ${PREFIX}/${APACHEMODDIR}/mod_apreq2*
	${RMDIR} -p ${PREFIX}/${APACHEINCLUDEDIR}/apreq2 \
		${PREFIX}/${APACHEMODDIR} 2>/dev/null || :
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/APR/Request/Request.so
.for i in Apache2 CGI Cookie Error Hook Param Parser
	${STRIP_CMD} \
		${PREFIX}/${SITE_ARCH_REL}/auto/APR/Request/${i}/${i}.so
.endfor

.include <bsd.port.mk>
