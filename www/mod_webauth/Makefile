PORTNAME=	mod_webauth
PORTVERSION=	4.7.0
CATEGORIES=	www
MASTER_SITES=	http://webauth.stanford.edu/dist/
DISTNAME=	webauth-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache module for authenticating users with Kerberos v5
WWW=		http://webauth.stanford.edu/

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libsasl2.so:security/cyrus-sasl2

USES=		apache ldap libtool pathfix pkgconfig ssl
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--with-ldap-lib=${LOCALBASE}/lib \
		--with-ldap-include=${LOCALBASE}/include \
		--with-openssl=${OPENSSLBASE}
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} -e '/typedef int sig_atomic_t/d' \
		${WRKSRC}/portable/system.h

.include <bsd.port.mk>
