#include <stdio.h>
#include <stdlib.h>

// Step 1: Create node structure
struct Node {
    int data;
    struct Node *left;
    struct Node *right;
};

// Step 2: Create a new node
struct Node* createNode(int value) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->left = newNode->right = NULL;
    return newNode;
}

// Step 3: Insert function with level tracking
struct Node* insert(struct Node* root, int value, int level) {

    // If tree is empty, insert here
    if (root == NULL) {
        printf("Inserted %d at level %d\n", value, level);
        return createNode(value);
    }

    // If value already exists
    if (value == root->data) {
        printf("Element %d already exists at level %d\n", value, level);
        return root;
    }

    // Go to left subtree
    if (value < root->data) {
        root->left = insert(root->left, value, level + 1);
    }
    // Go to right subtree
    else {
        root->right = insert(root->right, value, level + 1);
    }

    return root;
}

// Step 4: Inorder display (for checking BST)
void inorder(struct Node* root) {
    if (root != NULL) {
        inorder(root->left);
        printf("%d ", root->data);
        inorder(root->right);
    }
}

// Step 5: Main function
int main() {
    struct Node* root = NULL;
    int n, value;

    printf("Enter number of elements: ");
    scanf("%d", &n);

    printf("Enter elements:\n");

    for (int i = 0; i < n; i++) {
        scanf("%d", &value);
        root = insert(root, value, 1);
    }

    printf("\nInorder Traversal of BST:\n");
    inorder(root);

    return 0;
}
