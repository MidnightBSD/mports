PORTNAME=	skk
PORTVERSION=	9.6
PORTREVISION=	3
CATEGORIES=	japanese elisp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The "meta-port" for the SKK Japanese-input software
WWW=		http://openlab.jp/skk/

LICENSE=	bsd2

RUN_DEPENDS=	${LOCALBASE}/share/skk/${SKKJISYO}:japanese/skk-jisyo \
		${LOCALBASE}/bin/skkdic-count:japanese/skk-tools \
		${LOCALBASE}/sbin/skkserv:japanese/skkserv

USES=		metaport

SKKJISYO_SIZE?=	L
SKKJISYO?=	SKK-JISYO.${SKKJISYO_SIZE}

.include <bsd.port.mk>
