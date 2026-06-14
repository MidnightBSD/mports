PORTNAME=	git-tools
PORTVERSION=	2020.09
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Assorted git-related scripts and tools
WWW=		https://github.com/MestreLion/git-tools

LICENSE=	gpl3

RUN_DEPENDS=	bash:shells/bash \
		git:devel/git

USES=		pathfix python:run shebangfix

USE_GITHUB=	yes
GH_ACCOUNT=	MestreLion

NO_BUILD=	yes

CMDS=	git-branches-rename \
	git-clone-subset \
	git-find-uncommitted-repos \
	git-rebase-theirs \
	git-restore-mtime \
	git-strip-merge

PLIST_FILES=	${CMDS:S|^|bin/|} \
		${CMDS:S|^|share/man/man1/|:S|$|.1.gz|}

SHEBANG_FILES=	git-restore-mtime

do-install:
.for f in ${CMDS}
	${INSTALL_SCRIPT} ${WRKSRC}/${f} ${PREFIX}/bin/$f
	${INSTALL_MAN} ${WRKSRC}/man1/${f}.1 ${PREFIX}/share/man/man1/${f}.1
.endfor

.include <bsd.port.mk>
