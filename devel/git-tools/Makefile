PORTNAME=	git-tools
DISTVERSIONPREFIX=	v
PORTVERSION=	2020.09
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Assorted git-related scripts and tools

LICENSE=	gpl3

RUN_DEPENDS=	bash:shells/bash \
		git:devel/git

USES=		pathfix python:run

USE_GITHUB=	yes
GH_ACCOUNT=	MestreLion

NO_BUILD=	yes

CMDS=	git-branches-rename \
	git-clone-subset \
	git-find-uncommitted-repos \
	git-rebase-theirs \
	git-restore-mtime \
	git-strip-merge

do-install:
.for f in ${CMDS}
	${INSTALL_SCRIPT} ${WRKSRC}/${f} ${PREFIX}/bin/$f
	${INSTALL_MAN} ${WRKSRC}/man1/${f}.1 ${PREFIX}/man/man1/${f}.1
.endfor


.include <bsd.port.mk>
