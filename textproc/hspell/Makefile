# Created by: Yonatan <onatan@gmail.com>
# $FreeBSD: head/hebrew/hspell/Makefile 386312 2015-05-14 10:15:04Z mat $
# $MidnightBSD$

PORTNAME=	hspell
PORTVERSION=	1.1
CATEGORIES=	hebrew
MASTER_SITES=	http://hspell.ivrix.org.il/ \
		FREEBSD_LOCAL/makc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hebrew spellchecker and morphology engine

LICENSE=	gpl2

USES=		shebangfix gmake perl5
USE_PERL5=	build
GNU_CONFIGURE=	yes
CFLAGS+=	-fPIC
SHEBANG_FILES=	pmerge multispell

SUB_FILES=	pkg-message
SUB_LIST=	PORTSDIR=${PORTSDIR}

.include <bsd.port.mk>
