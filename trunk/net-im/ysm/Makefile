# $MidnightBSD: mports/net-im/ysm/Makefile,v 1.1 2013/03/09 21:50:42 laffer1 Exp $

PORTNAME=	ysm
PORTVERSION=	7.2.9.9.1
PORTREVISION=	1
CATEGORIES=	net-im
MASTER_SITES=	SF/${PORTNAME}v7/${PORTNAME}v7/${PORTNAME}v7%202.9.9.1
DISTNAME=	${PORTNAME}v${PORTVERSION:S/./_/g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line ICQ client with ICQ2000 and recoding support
LICENSE=	gpl2

.if ${CC} == "clang"
USE_CSTD=	c89
.endif

USES=		iconv
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -liconv

MAN1=		ysm.1
PLIST_FILES=	bin/ysm

post-patch:
	@${REINPLACE_CMD} -e \
		's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure

.include <bsd.port.mk>
