

PORTNAME=	openslp
PORTVERSION=	2.0.0
PORTREVISION=	2
CATEGORIES=	net
MASTER_SITES=	SF/${PORTNAME}/${PORTVERSION}/${PORTVERSION}%20Release

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source implementation of the Service Location Protocol

LICENSE=	bsd3

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		libtool ssl
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--sysconfdir=${PREFIX}/etc/openslp \
		--localstatedir=/var
CPPFLAGS+=	-DHAVE_STRNCASECMP

USE_RC_SUBR=	slpd

OPTIONS_DEFINE=	SLP_SECURITY ASYNC_API DOCS
SLP_SECURITY_DESC=	Turn on SLPv2 security support
ASYNC_API_DESC=		Enable asynchronous communication API

SLP_SECURITY_CONFIGURE_ENABLE=	slpv2-security
ASYNC_API_CONFIGURE_ENABLE=	async-api

post-extract:
	@(cd ${WRKSRC}; \
		${FIND} doc -type f -path '*/CVS/*' -delete; \
		${FIND} doc -type d -name CVS -delete)

post-install:
.for FILE in slp.conf slp.reg slp.spi
	${INSTALL_DATA} ${WRKSRC}/etc/${FILE} ${PREFIX}/etc/openslp/${FILE}.sample
.endfor
	@${MKDIR} ${DOCSDIR}
	(cd ${INSTALL_WRKSRC}/doc && ${COPYTREE_SHARE} . ${DOCSDIR})

.include <bsd.port.mk>
