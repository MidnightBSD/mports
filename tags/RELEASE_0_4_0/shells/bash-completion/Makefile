# $MidnightBSD: mports/shells/bash-completion/Makefile,v 1.5 2009/12/28 22:34:40 laffer1 Exp $

PORTNAME=	bash-completion
PORTVERSION=	1.3
PORTEPOCH=	1
CATEGORIES=	shells
MASTER_SITES=	http://bash-completion.alioth.debian.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programmable completion library for Bash
LICENSE=	unknown

RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash

CONFLICTS=	bash-completion-classic-[0-9]*

GNU_CONFIGURE=	yes
USE_BZIP2=	yes

SUB_FILES=	pkg-message

post-patch:
	@${ECHO_CMD} You can safely ignore this next error...
	-@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g; \
		s|/etc/bash_completion|${PREFIX}&|g; \
		s|/usr\(/sbin/postconf\)|${PREFIX}\1|g; \
		s|/usr\(/lib/rpm/macros\)|${PREFIX}\1|g; \
		s|/usr/share\(/ssl/openssl.cnf\)|/etc\1|g; \
		s|/usr/ports|${PORTSDIR}|g; \
		s|/usr/lib\(/aspell\)|${PREFIX}/share\1|g; \
		s|/usr/share/info|&:${PREFIX}/info|g; \
		s|\$$(sysconfdir)/profile.d|${PREFIX}/bin|g; \
		s|FLAC|&\|flv\|FLV|' \
		${WRKSRC}/bash_completion ${WRKSRC}/Makefile.in \
		${WRKSRC}/completions/* ${WRKSRC}/completions/helpers/*


.include <bsd.port.mk>
