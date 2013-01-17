# $MidnightBSD: mports/graphics/giflib/Makefile,v 1.1 2011/08/17 23:39:34 laffer1 Exp $
# $FreeBSD: ports/graphics/giflib/Makefile,v 1.48 2010/12/04 07:31:57 ade Exp $

PORTNAME=	giflib
PORTVERSION=	4.2.0
PORTREVISION=	0
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-4.x
PKGNAMESUFFIX=	${NOX11SUFFIX}${PKGNAMESUFFIX2}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools and library routines for working with GIF images
LICENSE=	mit

CONFLICTS=	libungif-[0-9]

USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if !defined(NOPORTDOCS)
BUILD_DEPENDS+=	xmlto:${PORTSDIR}/textproc/xmlto \
		${LOCALBASE}/share/xml/docbook/4.1.2:${PORTSDIR}/textproc/docbook-sk
.endif

.if defined(WITHOUT_X11)
PLIST_SUB+=	X11='@comment '
CONFIGURE_ARGS+=	--with-x=no
NOX11SUFFIX=	-nox11
.else
USE_XORG=	sm x11
PLIST_SUB+=	X11=''
CPPFLAGS+=	-I${LOCALBASE}/include
.endif

post-patch:
	${CP} ${FILESDIR}/quantize.c ${WRKSRC}/lib/
.if defined(NOPORTDOCS)
	${REINPLACE_CMD} -e 's|SUBDIRS = lib util doc pic|SUBDIRS = lib util pic|' \
		${WRKSRC}/Makefile.in
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.txt ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
