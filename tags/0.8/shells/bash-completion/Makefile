# $MidnightBSD$

PORTNAME=	bash-completion
PORTVERSION=	2.1
PORTEPOCH=	1
CATEGORIES=	shells
MASTER_SITES=	http://bash-completion.alioth.debian.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programmable completion library for Bash
LICENSE=	unknown

RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash

CONFLICTS=	bash-completion-classic-[0-9]*

USES=		gmake tar:bzip2
GNU_CONFIGURE=	yes

SUB_FILES=	pkg-message
SUB_LIST+=	RUNFILE=${DATADIR}/bash_completion.sh
PORTDOCS=	*

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g; \
		s|/etc/bash_completion|${PREFIX}&|g; \
		s|/usr\(/sbin/postconf\)|${PREFIX}\1|g; \
		s|/usr\(/lib/rpm/macros\)|${PREFIX}\1|g; \
		s|/usr/share\(/ssl/openssl.cnf\)|/etc\1|g; \
		s|/usr/ports|${PORTSDIR}|g; \
		s|/usr/lib\(/aspell\)|${PREFIX}/share\1|g; \
		s|/usr/share/info|&:${PREFIX}/info|g; \
		s|\$$(sysconfdir)/profile.d|${PREFIX}/bin|g; \
		s|FLAC|&\|flv\|FLV|; \
		s|\(profiledir = \)${PREFIX}/bin|\1${DATADIR}|g; \
		s|\$$(datadir)/pkgconfig|${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/bash_completion ${WRKSRC}/Makefile.in \
		${WRKSRC}/completions/*

post-install:
	@${MKDIR} ${DOCSDIR}
.for i in README doc/bash_completion.txt doc/bashrc doc/inputrc
	${INSTALL_DATA} ${WRKSRC}/$i ${DOCSDIR}
.endfor


.include <bsd.port.mk>
