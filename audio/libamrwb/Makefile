# New ports collection makefile for:	libamrwb
# Date created:	7 Jun 2007
# Whom:		Tatsuki Makino <tatsuki_makino@hotmail.com>
#
# $MidnightBSD: mports/audio/libamrwb/Makefile,v 1.2 2009/09/20 00:26:04 laffer1 Exp $
# $FreeBSD: ports/audio/libamrwb/Makefile,v 1.5 2008/06/01 20:31:01 miwi Exp $
#

PORTNAME=	libamrwb
PORTVERSION=	7.0.0.3
CATEGORIES=	audio
MASTER_SITES=	http://ftp.penguin.cz/pub/users/utx/amr/ \
		http://www.3gpp.org/ftp/Specs/archive/26_series/26.204/:3GPP
DISTNAME=	amrwb-${DISTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${SRC3GPP}:3GPP
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	3GPP Adaptive Multi-Rate - Wideband (AMR-WB) Speech Codec
LICENSE=	restricted

BUILD_DEPENDS=	${UNZIP_CMD}:${PORTSDIR}/archivers/unzip

RESTRICTED=	license prohibits redistribution
RESTRICTED_FILES=	${SRC3GPP}
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
PORTDOCS=	AUTHORS COPYING ChangeLog NEWS README TODO readme.txt
SUB_FILES=	pkg-message
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	LANG=C
MAKE_ENV=	LANG=C
USE_LDCONFIG=	yes

SRC3GPP=	26204-700.zip

post-extract:
	@${CP} ${DISTDIR}/${SRC3GPP} ${WRKSRC}/

post-install:
.ifndef(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
. for FILE in ${PORTDOCS}
		${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}
. endfor
.endif

.include <bsd.port.mk>
