# $MidnightBSD$

PORTNAME=	patchutils
PORTVERSION=	0.3.3
PORTREVISION=	1
CATEGORIES=	misc
MASTER_SITES=	http://cyberelk.net/tim/data/patchutils/stable/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small collection of programs that operate on patch files

LICENSE=	gpl2

USES=		tar:xz
USE_PERL5=	yes
GNU_CONFIGURE=	yes

post-patch:
	@${GREP} -lR "#!/bin/bash" ${WRKSRC} | ${XARGS} ${PERL} -pi.bak -e \
		"s,#!/bin/bash,#!/bin/sh,"

.include <bsd.port.mk>
