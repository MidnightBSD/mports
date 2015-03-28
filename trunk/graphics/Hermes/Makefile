# $MidnightBSD$

PORTNAME=	Hermes
PORTVERSION=	1.3.3
PORTREVISION=	4
CATEGORIES=	graphics
MASTER_SITES=	ftp://ftp.su.se/pub/lunar/source-archive/ \
		${MASTER_SITE_GENTOO}
MASTER_SITE_SUBDIR=	distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast pixel formats conversion library

LICENSE=	gpl2

USES=		gmake tar:bzip2 libtool
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.1
MAKE_ARGS=	ACLOCAL="${TRUE}" AUTOCONF="${TRUE}" AUTOMAKE="${TRUE}" \
		AUTOHEADER="${TRUE}"
USE_LDCONFIG=	yes

PORTDOCS=	*

.include <bsd.port.pre.mk>

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in AUTHORS ChangeLog FAQ README TODO TODO.conversion
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
	@${MKDIR} ${DOCSDIR}/API
.for f in api-1.htm api-2.htm api-3.htm api-4.htm api.htm api.ps api.txt
	${INSTALL_DATA} ${WRKSRC}/docs/api/${f} ${DOCSDIR}/API
.endfor
	${INSTALL_DATA} ${WRKSRC}/docs/api/sgml/api.sgml ${DOCSDIR}/API
.endif

.include <bsd.port.post.mk>
