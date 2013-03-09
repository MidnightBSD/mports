# $MidnightBSD$

PORTNAME=	ysm
PORTVERSION=	7.2.9.9.1
CATEGORIES=	net-im
MASTER_SITES=	SF/${PORTNAME}v7/${PORTNAME}v7/${PORTNAME}v7%202.9.9.1
DISTNAME=	${PORTNAME}v${PORTVERSION:S/./_/g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line ICQ client with ICQ2000 and recoding support
LICENSE=	gpl2

.if ${CC} == "clang"
USE_CSTD=	c89
.endif

USE_ICONV=	yes
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
