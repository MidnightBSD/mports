# New ports collection makefile for:   libofx
# Date created:        February 16 2003
# Whom:                Glenn Johnson <glennpj@charter.net>
#
# $MidnightBSD: mports/finance/libofx/Makefile,v 1.1 2008/04/29 02:35:40 laffer1 Exp $
# $FreeBSD: ports/finance/libofx/Makefile,v 1.21 2008/03/13 20:56:54 miwi Exp $
#

PORTNAME=	libofx
PORTVERSION=	0.9.0
CATEGORIES=	finance
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenSource implementation of the OFX (Open Financial eXchange)
LICENSE=        gpl2
LIB_DEPENDS=	curl.4:${PORTSDIR}/ftp/curl \
		xml\\+\\+-1.0.1:${PORTSDIR}/textproc/libxml++ \
		osp.5:${PORTSDIR}/textproc/opensp

USE_GNOME=	gnometarget
USE_ICONV=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--disable-doxygen --disable-dot --disable-gengetopt \
		--with-opensp-includes=${LOCALBASE}/include/OpenSP
USE_LDCONFIG=	yes

CPPFLAGS=	-I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in AUTHORS ChangeLog INSTALL NEWS README totest.txt
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
	${TAR} -C ${WRKSRC}/doc -cf - html | \
		${TAR} -C ${DOCSDIR} --unlink -xf -
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
.endif

.include <bsd.port.mk>
